OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64",
	      "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)

SECTIONS
{
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x400000)); . = SEGMENT_START("text-segment", 0x400000) + SIZEOF_HEADERS;
.sharedlib 0x80000000 : {
  KEEP(*(".text.fprintf"))
  KEEP(*(".data.fprintf"))
  KEEP(*(".text.free"))
  KEEP(*(".data.free"))
  KEEP(*(".text.gettimeofday"))
  KEEP(*(".data.gettimeofday"))
  KEEP(*(".text._GLOBAL_OFFSET_TABLE_"))
  KEEP(*(".data._GLOBAL_OFFSET_TABLE_"))
  KEEP(*(".text.malloc"))
  KEEP(*(".data.malloc"))
  KEEP(*(".text.printf"))
  KEEP(*(".data.printf"))
  KEEP(*(".text.puts"))
  KEEP(*(".data.puts"))
  KEEP(*(".text.read"))
  KEEP(*(".data.read"))
  KEEP(*(".text.sod_binarize_image"))
  KEEP(*(".data.sod_binarize_image"))
  KEEP(*(".text.sod_canny_edge_image"))
  KEEP(*(".data.sod_canny_edge_image"))
  KEEP(*(".text.sod_cnn_config"))
  KEEP(*(".data.sod_cnn_config"))
  KEEP(*(".text.sod_cnn_create"))
  KEEP(*(".data.sod_cnn_create"))
  KEEP(*(".text.sod_cnn_destroy"))
  KEEP(*(".data.sod_cnn_destroy"))
  KEEP(*(".text.sod_cnn_predict"))
  KEEP(*(".data.sod_cnn_predict"))
  KEEP(*(".text.sod_cnn_prepare_image"))
  KEEP(*(".data.sod_cnn_prepare_image"))
  KEEP(*(".text.sod_copy_image"))
  KEEP(*(".data.sod_copy_image"))
  KEEP(*(".text.sod_crop_image"))
  KEEP(*(".data.sod_crop_image"))
  KEEP(*(".text.sod_dilate_image"))
  KEEP(*(".data.sod_dilate_image"))
  KEEP(*(".text.sod_erode_image"))
  KEEP(*(".data.sod_erode_image"))
  KEEP(*(".text.sod_free_image"))
  KEEP(*(".data.sod_free_image"))
  KEEP(*(".text.sod_grayscale_image"))
  KEEP(*(".data.sod_grayscale_image"))
  KEEP(*(".text.sod_hilditch_thin_image"))
  KEEP(*(".data.sod_hilditch_thin_image"))
  KEEP(*(".text.sod_hough_lines_detect"))
  KEEP(*(".data.sod_hough_lines_detect"))
  KEEP(*(".text.sod_hough_lines_release"))
  KEEP(*(".data.sod_hough_lines_release"))
  KEEP(*(".text.sod_image_blob_boxes_release"))
  KEEP(*(".data.sod_image_blob_boxes_release"))
  KEEP(*(".text.sod_image_draw_bbox_width"))
  KEEP(*(".data.sod_image_draw_bbox_width"))
  KEEP(*(".text.sod_image_draw_circle_thickness"))
  KEEP(*(".data.sod_image_draw_circle_thickness"))
  KEEP(*(".text.sod_image_draw_line"))
  KEEP(*(".data.sod_image_draw_line"))
  KEEP(*(".text.sod_image_find_blobs"))
  KEEP(*(".data.sod_image_find_blobs"))
  KEEP(*(".text.sod_image_free_blob"))
  KEEP(*(".data.sod_image_free_blob"))
  KEEP(*(".text.sod_image_to_blob"))
  KEEP(*(".data.sod_image_to_blob"))
  KEEP(*(".text.sod_img_load_from_file"))
  KEEP(*(".data.sod_img_load_from_file"))
  KEEP(*(".text.sod_img_load_from_mem"))
  KEEP(*(".data.sod_img_load_from_mem"))
  KEEP(*(".text.sod_img_save_as_jpeg"))
  KEEP(*(".data.sod_img_save_as_jpeg"))
  KEEP(*(".text.sod_img_save_as_png"))
  KEEP(*(".data.sod_img_save_as_png"))
  KEEP(*(".text.sod_img_set_load_from_directory"))
  KEEP(*(".data.sod_img_set_load_from_directory"))
  KEEP(*(".text.sod_img_set_release"))
  KEEP(*(".data.sod_img_set_release"))
  KEEP(*(".text.sod_minutiae"))
  KEEP(*(".data.sod_minutiae"))
  KEEP(*(".text.sod_otsu_binarize_image"))
  KEEP(*(".data.sod_otsu_binarize_image"))
  KEEP(*(".text.sod_realnet_create"))
  KEEP(*(".data.sod_realnet_create"))
  KEEP(*(".text.sod_realnet_destroy"))
  KEEP(*(".data.sod_realnet_destroy"))
  KEEP(*(".text.sod_realnet_detect"))
  KEEP(*(".data.sod_realnet_detect"))
  KEEP(*(".text.sod_realnet_load_model_from_disk"))
  KEEP(*(".data.sod_realnet_load_model_from_disk"))
  KEEP(*(".text.sod_resize_image"))
  KEEP(*(".data.sod_resize_image"))
  KEEP(*(".text.sod_rotate_image"))
  KEEP(*(".data.sod_rotate_image"))
  KEEP(*(".text.sod_sobel_image"))
  KEEP(*(".data.sod_sobel_image"))
  KEEP(*(".text.sod_threshold_image"))
  KEEP(*(".data.sod_threshold_image"))
  KEEP(*(".text.stderr"))
  KEEP(*(".data.stderr"))
}
  .interp         : { *(.interp) }
  .note.gnu.build-id  : { *(.note.gnu.build-id) }
  .hash           : { *(.hash) }
  .gnu.hash       : { *(.gnu.hash) }
  .dynsym         : { *(.dynsym) }
  .dynstr         : { *(.dynstr) }
  .gnu.version    : { *(.gnu.version) }
  .gnu.version_d  : { *(.gnu.version_d) }
  .gnu.version_r  : { *(.gnu.version_r) }
  .rela.dyn       :
    {
      *(.rela.init)
      *(.rela.text .rela.text.* .rela.gnu.linkonce.t.*)
      *(.rela.fini)
      *(.rela.rodata .rela.rodata.* .rela.gnu.linkonce.r.*)
      *(.rela.data .rela.data.* .rela.gnu.linkonce.d.*)
      *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*)
      *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*)
      *(.rela.ctors)
      *(.rela.dtors)
      *(.rela.got)
      *(.rela.bss .rela.bss.* .rela.gnu.linkonce.b.*)
      *(.rela.ldata .rela.ldata.* .rela.gnu.linkonce.l.*)
      *(.rela.lbss .rela.lbss.* .rela.gnu.linkonce.lb.*)
      *(.rela.lrodata .rela.lrodata.* .rela.gnu.linkonce.lr.*)
      *(.rela.ifunc)
    }
  .rela.plt       :
    {
      *(.rela.plt)
      PROVIDE_HIDDEN (__rela_iplt_start = .);
      *(.rela.iplt)
      PROVIDE_HIDDEN (__rela_iplt_end = .);
    }
  . = ALIGN(CONSTANT (MAXPAGESIZE));
  .init           :
  {
    KEEP (*(SORT_NONE(.init)))
  }
  .plt            : { *(.plt) *(.iplt) }
  .plt.got        : { *(.plt.got) }
  .plt.sec        : { *(.plt.sec) }
    
  .text           :
  {
    *(.text.unlikely .text.*_unlikely .text.unlikely.*)
    *(.text.exit .text.exit.*)
    *(.text.startup .text.startup.*)
    *(.text.hot .text.hot.*)
    *(SORT(.text.sorted.*))
    *(.text .stub .text.* .gnu.linkonce.t.*)
    /* .gnu.warning sections are handled specially by elf.em.  */
    *(.gnu.warning)
  }
  .fini           :
  {
    KEEP (*(SORT_NONE(.fini)))
  }
  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);
  . = ALIGN(CONSTANT (MAXPAGESIZE));
  /* Adjust the address for the rodata segment.  We want to adjust up to
     the same address within the page on the next page up.  */
  . = SEGMENT_START("rodata-segment", ALIGN(CONSTANT (MAXPAGESIZE)) + (. & (CONSTANT (MAXPAGESIZE) - 1)));
  .rodata         : { *(.rodata .rodata.* .gnu.linkonce.r.*) }
  .rodata1        : { *(.rodata1) }
  .eh_frame_hdr   : { *(.eh_frame_hdr) *(.eh_frame_entry .eh_frame_entry.*) }
  .eh_frame       : ONLY_IF_RO { KEEP (*(.eh_frame)) *(.eh_frame.*) }
  .gcc_except_table   : ONLY_IF_RO { *(.gcc_except_table .gcc_except_table.*) }
  .gnu_extab   : ONLY_IF_RO { *(.gnu_extab*) }
  /* These sections are generated by the Sun/Oracle C++ compiler.  */
  .exception_ranges   : ONLY_IF_RO { *(.exception_ranges*) }
  /* Adjust the address for the data segment.  We want to adjust up to
     the same address within the page on the next page up.  */
  . = DATA_SEGMENT_ALIGN (CONSTANT (MAXPAGESIZE), CONSTANT (COMMONPAGESIZE));
  /* Exception handling  */
  .eh_frame       : ONLY_IF_RW { KEEP (*(.eh_frame)) *(.eh_frame.*) }
  .gnu_extab      : ONLY_IF_RW { *(.gnu_extab) }
  .gcc_except_table   : ONLY_IF_RW { *(.gcc_except_table .gcc_except_table.*) }
  .exception_ranges   : ONLY_IF_RW { *(.exception_ranges*) }
  /* Thread Local Storage sections  */
  .tdata	  :
   {
     PROVIDE_HIDDEN (__tdata_start = .);
     *(.tdata .tdata.* .gnu.linkonce.td.*)
   }
  .tbss		  : { *(.tbss .tbss.* .gnu.linkonce.tb.*) *(.tcommon) }
  .preinit_array    :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  }
  .init_array    :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
    KEEP (*(.init_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .ctors))
    PROVIDE_HIDDEN (__init_array_end = .);
  }
  .fini_array    :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT_BY_INIT_PRIORITY(.fini_array.*) SORT_BY_INIT_PRIORITY(.dtors.*)))
    KEEP (*(.fini_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .dtors))
    PROVIDE_HIDDEN (__fini_array_end = .);
  }
  .ctors          :
  {
    /* gcc uses crtbegin.o to find the start of
       the constructors, so we make sure it is
       first.  Because this is a wildcard, it
       doesn't matter if the user does not
       actually link against crtbegin.o; the
       linker won't look for a file to match a
       wildcard.  The wildcard also means that it
       doesn't matter which directory crtbegin.o
       is in.  */
    KEEP (*crtbegin.o(.ctors))
    KEEP (*crtbegin?.o(.ctors))
    /* We don't want to include the .ctor section from
       the crtend.o file until after the sorted ctors.
       The .ctor section from the crtend file contains the
       end of ctors marker and it must be last */
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  }
  .dtors          :
  {
    KEEP (*crtbegin.o(.dtors))
    KEEP (*crtbegin?.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
  }
  .jcr            : { KEEP (*(.jcr)) }
  .data.rel.ro : { *(.data.rel.ro.local* .gnu.linkonce.d.rel.ro.local.*) *(.data.rel.ro .data.rel.ro.* .gnu.linkonce.d.rel.ro.*) }
  .dynamic        : { *(.dynamic) }
  .got            : { *(.got) *(.igot) }
  . = DATA_SEGMENT_RELRO_END (SIZEOF (.got.plt) >= 24 ? 24 : 0, .);
  .got.plt        : { *(.got.plt) *(.igot.plt) }
  
  . = ALIGN(CONSTANT (MAXPAGESIZE));
  .libtext :
  {
      *(.text.set_var) /* Function from the library */
  }

  . = ALIGN(CONSTANT (MAXPAGESIZE));
  .libbss :
  {
      *(.bss.gVar) /* Global variable from the library */
  }

  . = ALIGN(CONSTANT (MAXPAGESIZE));
  .text :
  {
      *(.text.main) /* Main function from the application */
  }
  .data           :
  {
    *(.data .data.* .gnu.linkonce.d.*)
    SORT(CONSTRUCTORS)
  }
  .data1          : { *(.data1) }
  _edata = .; PROVIDE (edata = .);
  . = .;
  __bss_start = .;
  .bss            :
  {
   *(.dynbss)
   *(.bss .bss.* .gnu.linkonce.b.*)
   *(COMMON)
   /* Align here to ensure that the .bss section occupies space up to
      _end.  Align after .bss to ensure correct alignment even if the
      .bss section disappears because there are no input sections.
      FIXME: Why do we need it? When there is no .bss section, we do not
      pad the .data section.  */
   . = ALIGN(. != 0 ? 64 / 8 : 1);
  }
  .lbss   :
  {
    *(.dynlbss)
    *(.lbss .lbss.* .gnu.linkonce.lb.*)
    *(LARGE_COMMON)
  }
  . = ALIGN(64 / 8);
  . = SEGMENT_START("ldata-segment", .);
  .lrodata   ALIGN(CONSTANT (MAXPAGESIZE)) + (. & (CONSTANT (MAXPAGESIZE) - 1)) :
  {
    *(.lrodata .lrodata.* .gnu.linkonce.lr.*)
  }
  .ldata   ALIGN(CONSTANT (MAXPAGESIZE)) + (. & (CONSTANT (MAXPAGESIZE) - 1)) :
  {
    *(.ldata .ldata.* .gnu.linkonce.l.*)
    . = ALIGN(. != 0 ? 64 / 8 : 1);
  }
  . = ALIGN(64 / 8);
  _end = .; PROVIDE (end = .);
  . = DATA_SEGMENT_END (.);
  /* Stabs debugging sections.  */
  .stab          0 : { *(.stab) }
  .stabstr       0 : { *(.stabstr) }
  .stab.excl     0 : { *(.stab.excl) }
  .stab.exclstr  0 : { *(.stab.exclstr) }
  .stab.index    0 : { *(.stab.index) }
  .stab.indexstr 0 : { *(.stab.indexstr) }
  .comment       0 : { *(.comment) }
  .gnu.build.attributes : { *(.gnu.build.attributes .gnu.build.attributes.*) }
  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line .debug_line.* .debug_line_end) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* SGI/MIPS DWARF 2 extensions */
  .debug_weaknames 0 : { *(.debug_weaknames) }
  .debug_funcnames 0 : { *(.debug_funcnames) }
  .debug_typenames 0 : { *(.debug_typenames) }
  .debug_varnames  0 : { *(.debug_varnames) }
  /* DWARF 3 */
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges   0 : { *(.debug_ranges) }
  /* DWARF Extension.  */
  .debug_macro    0 : { *(.debug_macro) }
  .debug_addr     0 : { *(.debug_addr) }
  .gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }
}
