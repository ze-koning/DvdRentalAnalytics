with active_customer as (
    select * from {{ ref('active_customers_stg') }}
),

final as (
    select first_name, last_name, email, active, country
    from active_customer as ac
    inner join {{ source('dvd_rental', 'address') }} as add
    on ac.address_id=add.address_id
    inner join {{ source('dvd_rental', 'city') }} as city
    on add.city_id=city.city_id
    inner join {{ source('dvd_rental', 'country') }} as ctry
    on city.country_id=ctry.country_id
    where country='Nigeria'
)

select * from final