module ChildrenHelper
  def parent_redirect_to(dashboard)
    if dashboard.category == 'medicine'
      "/dashboard/children/#{dashboard.child_id}/#{dashboard.category}/#{dashboard.id}/edit"
    else
     "/dashboard/children/#{dashboard.child_id}/#{dashboard.category}/#{dashboard.id}"
    end
  end

  def cover_child_pic_image_tag(child)
    if child.child_pic?
      image_tag child.child_pic.thumb.url, id: 'preview_child_pic'
    else
      image_tag fake_image, id: 'preview_child_pic'
    end
  end

  def show_child_pic_image(child)
    if child.child_pic?
      child.child_pic
    else
      fake_image
    end
  end

  private
  def fake_image
    "https://fakeimg.pl/247x247/FFDD55/FFA488/?text=小孩照片&font=noto"
  end
end
