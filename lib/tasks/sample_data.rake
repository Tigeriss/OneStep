namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_news
    make_styles
  end
end

def make_users
    admin = User.create!(nickname: "admin", email: "tigeriss@mail.ru", password: "tigeriss", password_confirmation: "tigeriss", admin: true)
end
def make_news

  12.times do |n|
    title = "#{n+1} новость нашей студии"
    description = "Новость нашей студии номер #{n+1}"
    text = "Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости. Тут будет текст новости."
    image_link = "http://cs605718.vk.me/v605718191/2972/piZ9o0VH0R8.jpg"
    News.create!(title: title, description: description, text: text, image_link: image_link)
  end
  
end

def make_styles

  12.times do |s|
    name = "#{s+1} стиль"
    description = "Стиль номер #{s+1}"
    text = "Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля. Тут будет описание стиля."
    media_url = "http://cs412927.vk.me/v412927191/2c43/XtghtfNbnJU.jpg"
    Style.create!(name: name, description: description, text: text, media_url: media_url)
  end
  
end