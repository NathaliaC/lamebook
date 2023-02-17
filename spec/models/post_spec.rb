# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
  it { is_expected.to belong_to :user }
end
