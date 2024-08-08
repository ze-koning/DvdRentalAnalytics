with customer as (
    select * from {{ source('dvd_rental', 'customer') }}
),

final as (
    select first_name, last_name, email, active
    from customer
    where active = 1
)

select * from final