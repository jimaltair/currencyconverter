create table if not exists currency
(
    num_code varchar(255) not null
        constraint currency_pkey
            primary key,
    char_code varchar(255) not null,
    name varchar(255) not null,
    nominal integer not null
);

alter table currency owner to postgres;

create table if not exists currency_rate
(
    id                bigint generated by default as identity
        constraint currency_rate_pkey
            primary key,
    date              date             not null,
    rate              double precision not null,
    currency_num_code varchar(255)
        constraint fkiy7wsvrytye9mfumerty9gupy
            references currency
);

alter table currency_rate
    owner to postgres;

create table if not exists exchange
(
    id bigint generated by default as identity
        constraint exchange_pkey
            primary key,
    amount numeric(19,2) not null,
    made_at timestamp not null,
    first_currency_code varchar(255)
        constraint fkhhwuhkhoclq89p9xxs1c74f2i
            references currency,
    second_currency_code varchar(255)
        constraint fk5nbpejfr2grl4erjuh4ontvr4
            references currency
);

alter table exchange owner to postgres;