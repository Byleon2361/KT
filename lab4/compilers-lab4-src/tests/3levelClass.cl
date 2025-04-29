-- Иерархия классов (3 уровня)
class GrandParent {
    -- Класс верхнего уровня
};

class Parent inherits GrandParent {
    -- Промежуточный класс
};

class Child inherits Parent {
    -- Класс нижнего уровня
};