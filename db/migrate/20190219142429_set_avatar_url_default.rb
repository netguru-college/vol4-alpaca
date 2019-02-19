# frozen_string_literal: true

class SetAvatarUrlDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :avatar_url, 'https://st3.depositphotos.com/6811030/13096/v/1600/depositphotos_130962816-stock-illustration-cartoon-farmer-or-redneck.jpg'
  end
end
