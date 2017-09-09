# В этом файле мы можем писать вспомогательные методы (хелперы) для
# шаблонов (view) нашего приложения.
module ApplicationHelper
  # Этот метод возвращает ссылку на автарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку, которая лежит в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def decline(number, krokodil,krokodila,krokodilov)
    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    rest = number % 10
    unique_rest = number % 100

    condition = (unique_rest.between?(11,14) ||   # Если 111 поделить на 10 вместо 100, то вернет 111 негритенок вместо 111 негритят,
                                                  # поскольку остача от деления на 10 равна 1. Взять еще раз остачу от деления rest на 10 нельзя,
                                                  # 111 % 10 = 1, 1 % 10 = 1. 111 % 100 = 11
        number.between?(11,14) ||                 # Например, вместо 11-14 негритят вернетcя 11-14 негритенок,
                                                  # потому  нужно проверить попадает ли в промежуток от 11-14
        rest > 4 ||                               # Если передан 0 как парам ком строки,то должно вернуть 0 негритят,
                                                  # так же если число больше 4 -> 4 негритенка, но 5 негритят.
        rest == 0)

    if condition
      krokodilov
    elsif rest == 1
      krokodil
    elsif rest >= 2 && rest <= 4
      krokodila
    end
  end
end

