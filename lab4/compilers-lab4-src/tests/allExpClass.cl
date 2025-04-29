-- Все виды выражений
class Expressions {
    -- Арифметические операции
    testArith(): Int {
        (1 + 2 * 3) / 2 - 4
    };
    
    -- Условные выражения
    testIf(a: Int, b: Int): Int {
        if a < b then a else b fi
    };
    
    -- Циклы
    testLoop(n: Int): Int {
        {
            let i: Int <- 0 in
            while i < n loop
                i <- i + 1
            pool;
            i;
        }
    };
    
    -- Блоки
    testBlock(): String {
        {
            let x: Int <- 1 in
            let y: Int <- 2 in
            x + y;
            "Block result";
        }
    };
    
    -- let-выражения
    testLet(): Int {
        let x: Int <- 1, y: Int <- 2 in
        x + y
    };
    
    -- case-выражения
    testCase(obj: Object): String {
        case obj of
            x: Int => "It's Int";
            s: String => "It's String";
            b: Bool => "It's Bool";
            o: Object => "Unknown type";
        esac
    };
    
    -- new
    testNew(): Object {
        new IO
    };
    
    -- isvoid
    testIsVoid(x: Object): Bool {
        isvoid x
    };
    
    -- Динамический dispatch
    testDispatch(io: IO): Object {
        io.out_string("Dispatch\n")
    };
    
    -- Статический dispatch
    testStaticDispatch(obj: Object): String {
        obj.type_name()
    };
};