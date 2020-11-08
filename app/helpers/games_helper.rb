# Этот файл будет автоматически загружен при отрисовке шаблона
# Мы будем складывать в него все вспомогательные методы, которые захотим использовать в шаблонах,
# связаныхх с отображением игр
module GamesHelper
  # Этот метод будет рисовать удобный ярлычок для показа статуса игры
  # Используем стандартные bootstrap-овский класс `label`
  def game_label(game)
    if game.status == :in_progress && current_user == game.user
      link_to content_tag(:span, t("game_statuses.#{game.status}"), class: 'label'), game_path(game)
    else
      label_status = "label-danger"
      label_status = "label-success" if t("game_statuses.#{game.status}").strip.downcase == "победа"
      content_tag :span, t("game_statuses.#{game.status}"), class: "label #{label_status}"
    end
  end
end
