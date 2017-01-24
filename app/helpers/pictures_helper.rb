module PicturesHelper
  def choose_new_or_edit(id)
    if action_name == 'new'
      pictures_path
    elsif action_name == 'edit'
      picture_path(id)
    end
  end
end
