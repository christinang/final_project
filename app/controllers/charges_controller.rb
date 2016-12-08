class ChargesController < ApplicationController
  def index
    @charges = Charge.all

    render("charges/index.html.erb")
  end

  def show
    @charge = Charge.find(params[:id])

    render("charges/show.html.erb")
  end

  def new
    @charge = Charge.new

    render("charges/new.html.erb")
  end

  def create
    @charge = Charge.new

    @charge.payer_id = params[:payer_id]
    @charge.ower_id = params[:ower_id]
    @charge.event_id = params[:event_id]
    @charge.amount = params[:amount]
    @charge.charge_description = params[:charge_description]

    save_status = @charge.save

    if save_status == true
      redirect_to(:back, :notice => "Charge created successfully.")
    else
      render("charges/new.html.erb")
    end
  end

  def edit
    @charge = Charge.find(params[:id])

    render("charges/edit.html.erb")
  end

  def update
    @charge = Charge.find(params[:id])

    @charge.payer_id = params[:payer_id]
    @charge.ower_id = params[:ower_id]
    @charge.event_id = params[:event_id]
    @charge.amount = params[:amount]
    @charge.charge_description = params[:charge_description]

    save_status = @charge.save

    if save_status == true
      redirect_to(:back, :notice => "Charge updated successfully.")
    else
      render("charges/edit.html.erb")
    end
  end

  def destroy
    @charge = Charge.find(params[:id])

    @charge.destroy

    if URI(request.referer).path == "/charges/#{@charge.id}"
      redirect_to("/", :notice => "This charge has been paid and removed from your tab.")
    else
      redirect_to(:back, :notice => "This charge has been paid and removed from your tab.")
    end
  end
end
