if Rails.env.development?
  ActionMailer::Base.logger = nil
end
