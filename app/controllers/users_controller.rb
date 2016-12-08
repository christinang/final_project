class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])

    @total_paid = @user.charges_paid.sum('amount')
    @total_owed = @user.charges_owed.sum('amount')
    @net = @total_owed - @total_paid

    totals_by_other_user = Hash.new {|h,k| h[k] = 0}

    @user.charges_owed.each do |charge|
    if charge.ower.id == current_user.id
    totals_by_other_user[charge.payer_id] -= charge.amount
    end
    end

    @user.charges_paid.each do |charge|
    if charge.payer.id == current_user.id
    totals_by_other_user[charge.ower_id] += charge.amount
    end
    end

    @totals_by_other_user = totals_by_other_user



    render("users/show.html.erb")
  end

end
