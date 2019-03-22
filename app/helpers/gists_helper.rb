module GistsHelper
  def flash_message(res_url)
    if res_url
      { notice: "<a href='#{res_url}'>#{t('surveys.gist.success')}</a>" }
    else
      { alert: t('surveys.gist.failure') }
    end
  end
end
