extern void (*getFunctionPtr())();

int main() {
    void (*functionPtr)() = getFunctionPtr();
    functionPtr(); // Calls myFunction
    return 0;
}

