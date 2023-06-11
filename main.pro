% Функционал List Comprehension при генерации решений в виде списков
list_comprehension(List) :- List = [X | _], between(1, 5, X).

% Вывод данных предметной области как поэлементный вывод списка
print_list([]).
print_list([H | T]) :- writeln(H), print_list(T).

% Поиск данных предметной области как поиск элементов в списке
search_list(Element, List) :- member(Element, List).

% Вычисление количества элементов в списке
count_elements(List, Count) :- length(List, Count).

% Вычисление максимального значения
max_value(List, Max) :- max_list(List, Max).

% Вычисление среднего значения
average_value(List, Average) :-
    sum_list(List, Sum),
    length(List, Count),
    Average is Sum / Count.

% Вычисление минимального значения
min_value(List, Min) :- min_list(List, Min).

% Получение значений через предикаты, возвращающие значения
get_population(Country, Population) :- population(Country, Population).
get_capitals(Continent, Capitals) :- findall(Capital, (capital(Capital, Country), country(Country, Continent)), Capitals).

% Домены
domains
    continent = symbol
    country = symbol
    capital = symbol
    population = integer

% Факты
facts
    capital(paris, france)
    capital(berlin, germany)
    capital(london, uk)
    capital(madrid, spain)
    capital(rome, italy)
    capital(ottawa, canada)
    capital(canberra, australia)
    capital(tokyo, japan)
    capital(cairo, egypt)
    capital(mexico_city, mexico)
    capital(ankara, turkey)
    capital(new_delhi, india)
    capital(beijing, china)
    capital(moscow, russia)
    capital(brasilia, brazil)

    country(france, europe)
    country(germany, europe)
    country(uk, europe)
    country(spain, europe)
    country(italy, europe)
    country(canada, north_america)
    country(australia, oceania)
    country(japan, asia)
    country(egypt, africa)
    country(mexico, north_america)
    country(turkey, asia)
    country(india, asia)
    country(china, asia)
    country(russia, europe)
    country(brazil, south_america)

    population(france, 67022000)
    population(germany, 83190556)
    population(uk, 66435600)
    population(spain, 46704314)
    population(italy, 60483973)
    population(canada, 38131104)
    population(australia, 25649909)
    population(japan, 125960000)
    population(egypt, 91251858)
    population(mexico, 122273473)
    population(turkey, 83154997)
    population(india, 1380004385)
    population(china, 1393409038)
    population(russia, 146599183)
    population(brazil, 211049527).

clauses
    % Правило для определения стран, находящихся в определенном континенте
countries_in_continent(Continent, Countries) :-
    findall(Country, (country(Country, Continent), capital(_, Country)), Countries).

% Правило для определения наиболее населенного государства
most_populous_country(Country) :-
    findall(Population-Country, population(Country, Population), Populations),
    max_list(Populations, _-Country).

% Правило для определения списка столиц на определенном континенте
capitals_in_continent(Continent, Capitals) :-
    findall(Capital, (capital(Capital, Country), country(Country, Continent)), Capitals).

% Правило для определения списка государств с населением выше заданного значения
countries_with_population_above(PopulationThreshold, Countries) :-
    findall(Country, (population(Country, Population), Population > PopulationThreshold), Countries).

% Правило для определения суммы населения на определенном континенте
total_population_in_continent(Continent, Total) :-
    findall(Population, (country(Country, Continent), population(Country, Population)), Populations),
    sum_list(Populations, Total)

goal
    implement(main).