module MedicineHelper
  def frontend_show_admin_sign
    if @find_medicine.admin_sign.url
      image_tag @find_medicine.admin_sign.small_thumb.url
    else
      "老師尚未簽章!"
    end
  end
end
