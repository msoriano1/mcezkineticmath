if Rails.env.development?
    BetterErrors::Middleware.allow_ip! '121.58.232.212'
end