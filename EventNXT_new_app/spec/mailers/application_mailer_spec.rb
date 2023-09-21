# require 'rails_helper'

# RSpec.describe ApplicationMailer, type: :mailer do
#   before do
#     # Configure ActionMailer to use test delivery method
#     ActionMailer::Base.delivery_method = :test
#     ActionMailer::Base.perform_deliveries = true
#     ActionMailer::Base.deliveries = []
#   end

#   describe "#send_email" do
#     let(:to) { "recipient@example.com" }
#     let(:subject) { "Test email subject" }
#     let(:body) { "Test email body" }

#     it "sends an email" do
#       mail = described_class.send_email(to, subject, body)

#       expect(mail.to).to eq([to])
#       expect(mail.subject).to eq(subject)
#       expect(mail.body).to include(body)
#       expect(ActionMailer::Base.deliveries.count).to eq(1)
#     end

#     it "uses the correct sender email" do
#       described_class.send_email(to, subject, body)
#       mail = ActionMailer::Base.deliveries.last

#       expect(mail.from).to eq(["fashionnxt@example.com"])
#     end
#   end
# end
