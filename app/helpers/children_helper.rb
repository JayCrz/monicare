module ChildrenHelper
  def cover_child_pic_image_tag(child)
    if child.child_pic?
      image_tag child.child_pic.thumb.url, id: 'preview_child_pic'
    else
      image_tag child_fake_image, id: 'preview_child_pic'
    end
  end

  def show_child_pic_image(child)
    if child.child_pic?
      child.child_pic
    else
      child_fake_image
    end
  end

  private
  def child_fake_image
    "https://fakeimg.pl/247x247/FFA488/D2D2D2/?text=小孩照片&font=noto"
  end
end
