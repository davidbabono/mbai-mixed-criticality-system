BASE_DIR=../


# SOD does not generally require a Makefile to build. Just drop sod.c and its accompanying
# header files on your source tree and you are done.
NCC = musl-gcc
SHARED_FLAGS=-nostdinc -nostdlib
NCFLAGS = -I. -DCPU_FREQ=3600 -O3 -lm -DLIBCOX_DISABLE_DISK_IO -ffunction-sections -fdata-sections $(SHARED_FLAGS)
LIB_LDFLAG = -Wl,--gc-sections -Wl,-T,debloating_lib.ld
LDFLAGS = -Wl,--gc-sections -Wl,-T,debloating.ld

#sod: sod.c
#	$(CC) sod.c samples/cnn_face_detection.c -o sod_face_detect -I. $(CFLAGS)

EXT = o


#SAMPLES = canny_edge_detection

SAMPLES = batch_img_loading \
		blob_detection \
		canny_edge_detection \
		cnn_coco \
		cnn_face_detection \
		cnn_object_detection \
		cnn_voc \
		crop_image \
		dilate_image \
		erode_image \
		grayscale_image \
		hilditch_thin \
		hough_lines_detection \
		license_plate_detection \
		minutiae \
		otsu_image \
		realnet_face_detection \
		resize_image \
		rnn_text_gen \
		rotate_image \
		sobel_operator_img


SAMPLESOUT = $(SAMPLES:%=bin/minlib/obj/%.$(EXT))


all: clean dir lib sod_bin sod_bin_min $(SAMPLESOUT) udsymbols

native: samples
#	samples.wasm
#      	samples

dir:
	mkdir -p bin/

copy:
	cp samples/*.png bin/
	cp samples/*.jpg bin/

samples: $(SAMPLESOUT)

lib: sod.o

sod.o: sod.c
	$(NCC) $(NCFLAGS) -c sod.c -o sod.o

sod_bin: sod.o
	$(NCC) $(LIB_LDFLAG) sod.o -o sod_bin -e main
	
sod_bin_min: sod.o
	$(NCC) -Wl,--gc-sections sod.o -o sod_bin_min -e main
	

bin/minlib/obj/%.$(EXT): samples/%.c
	$(NCC) $(NCFLAGS) -c $< -o $@


udsymbols:
	> undefined_symbols.txt
	for file in $(SAMPLESOUT); do \
		nm -u $$file | awk '{print $$2}' >> undefined_symbols.txt; \
	done
	sort undefined_symbols.txt | uniq > unique_symbols.txt

app_bins: $(SAMPLESOUT:.o=_bin)

bin/minlib/bin/%_bin: bin/minlib/obj/%.o
	$(NCC) $(LDFLAGS) sod_renamed.o $< -o $@

remove_sharedlib_section:
	for file in bin/minlib/bin/*; do \
		objcopy --remove-section=.sharedlib $$file; \
	done

clean:
	rm -f bin/minlib/obj/*.o 
	rm -f bin/minlib/bin/*_bin
