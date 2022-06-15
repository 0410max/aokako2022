class Public::HomesController < ApplicationController
  def top
    @users = EndUser.all
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

    @users1 = EndUser.where(dep: '文学部')
    @users2 = EndUser.where(dep: '経済学部')
    @users3 = EndUser.where(dep: '法学部')
    @users4 = EndUser.where(dep: '経営学部')
    @users5 = EndUser.where(dep: '理工学部')
    @users6 = EndUser.where(dep: '国際政治経済学部')
    @users7 = EndUser.where(dep: '総合文化政策学部')
    @users8 = EndUser.where(dep: '社会情報学部')
    @users9 = EndUser.where(dep: '教育人間科学部')
    @users10 = EndUser.where(dep: '地球社会共生学部')
    @users11 = EndUser.where(dep: 'コミュニティ人間科学部')
  end
end
