class Printer {
    -- Без параметров
    printHello(): Object { out_string("Hello\n") };
    
    -- Один параметр
    printInt(x: Int): Object { out_int(x) };
    
    -- Два параметра
    printTwo(x: Int, y: Int): Object {
        {
            out_int(x);
            out_string(", ");
            out_int(y);
        }
    };
    
    -- Три параметра
    printThree(a: Int, b: Int, c: Int): Object {
        {
            out_int(a);
            out_string(", ");
            out_int(b);
            out_string(", ");
            out_int(c);
        }
    };
};