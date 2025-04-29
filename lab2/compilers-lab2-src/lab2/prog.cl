class Main inherits IO {
    -- Атрибуты класса
    x : Int <- 42; -- поля класса
    y : Int <- 10;
    z : Bool <- true;
    s : String <- "Hello, Cool!";

    -- Метод main
    main() : Object {
        {
            -- Использование операторов
            x <- x + y * 2;
            y <- y - x / 2;
            z <- not z;

            -- Условный оператор
            if z then
                out_string("z is true\n")
            else
                out_string("z is false\n")
            fi;

            -- Цикл
            while x < 100 loop
                {
                    x <- x + 1;
                    out_int(x).out_string("\n");
                }
            pool;

            -- Локальные переменные (let)
            let a : Int <- 5, b : Int <- 10 in
                {
                    out_int(a + b).out_string("\n");
                };

            -- Оператор case
            case x of
                i : Int => out_int(i).out_string(" is an integer\n");
                b : Bool => out_string("This is a boolean\n");
                s : String => out_string("This is a string\n");
            esac;

            -- Создание объекта
            let obj : Main <- new Main in
                {
                    obj.out_string("New object created\n");
                };

            -- Проверка на void
            if isvoid obj then
                out_string("obj is void\n")
            else
                out_string("obj is not void\n")
            fi;

            (* abc (* *) -- dsf
            -- comm 
            *)

            (*
            * Example app.
            *
            *)
            0x123

            -- This is a class

            "String (* hello *)"

            "Str"

            "Multiline string\
            Hello"

            "Hello\n"

            "\
            zxc"
        }
    };
};