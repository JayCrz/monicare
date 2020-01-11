module Teacher::MiscHelper
  def cover_misc_pic_image_tag(dashboard)
    if dashboard.admin_sign?
      image_tag dashboard.admin_sign.thumb.url, id: 'preview_misc_pic'
    else
      image_tag fake_misc_image, id: 'preview_misc_pic', class: 'preview_misc_pic_new'
    end
  end

  def show_misc_pic_image(dashboard)
    if dashboard.admin_sign?
      dashboard.admin_sign
    else
      fake_misc_image
    end
  end
  private
  def fake_misc_image
    "https://fakeimg.pl/300x300/FFA488/D2D2D2/?text=圖片&font=noto"
  end
end
