-- Главный класс с точкой входа
class Main inherits IO {
    main(): Object {
        {
            out_string("Testing Cool features\n");
            
            -- Создание объектов
            let calc: Calculator <- new Calculator in
            let res: Int <- calc.add(2, 3) in
            out_int(res);
            
            -- Вызов различных выражений
            let expr: Expressions <- new Expressions in
            out_int(expr.testArith());
            
            -- Вывод завершен
            out_string("\nTests completed\n");
        }
    };
};