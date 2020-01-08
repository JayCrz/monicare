module Teacher::MedicineHelper
  def show_admin_sign
    if @medicine_dashboard.admin_sign.url
      image_tag @medicine_dashboard.admin_sign.small_thumb.url
    else
      "老師尚未簽章!"
    end
  end
end
