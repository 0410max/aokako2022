class Public::HomesController < ApplicationController
  def top
    @users = EndUser.where(is_deleted: false)
    @kakomons = Kakomon.all
    @boards = Board.all
    n1 = 0
    n2 = 0
    n3 = 0
    n4 = 0
    n5 = 0
    @users.each do |user|
      if user.number.slice(3) == '2' && user.number.slice(4) == '2'
        n1 += 1
      elsif user.number.slice(3) == '2' && user.number.slice(4) == '1'
        n2 += 1
      elsif user.number.slice(3) == '2' && user.number.slice(4) == '0'
        n3 += 1
      elsif user.number.slice(3) == '1' && user.number.slice(4) == '9'
        n4 += 1
      else
        n5 += 1
      end
    end

    @user1 = n1
    @user2 = n2
    @user3 = n3
    @user4 = n4
    @user5 = n5
  end
end
