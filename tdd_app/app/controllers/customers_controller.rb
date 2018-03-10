class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params_customer)

    if @customer.save
      redirect_to customers_path, notice: 'Customer created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(params_customer)
      redirect_to customer_path(@customer.id), notice: 'Customer updated!'
    else
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: "Customer deleted!"
    else
      render :index
    end
  end

  private
    def params_customer
      params.require(:customer).permit(:id, :name, :email, :smoker, :phone, :avatar)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end
end
