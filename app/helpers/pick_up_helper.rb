module PickUpHelper
  def cover_image_tag(pick_up)
    if pick_up.pick_up_pic?
      image_tag pick_up.pick_up_pic.thumb.url, id: 'preview_pick_up_pic'
    else
      image_tag fake_image, id: 'preview_pick_up_pic', class: 'preview_pick_up_pic_new'
    end
  end

  def show_image(pick_up)
    if pick_up.pick_up_pic?
      pick_up.pick_up_pic
    else
      fake_image
    end
  end
  private
  def fake_image
    "https://fakeimg.pl/300x300/FFDD55/FFA488/?text=請上傳圖&font=noto"
  end
end
