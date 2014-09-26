require 'rails_helper'

describe Vote do
  it { should belong_to(:user)}
  it { should belong_to(:rating)}
end
