class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy]
  before_action :find_user, only: %i[create update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    @test.author = @user

    if @test.save
      redirect_to [:admin, @test], notice: t('admin.tests.create.success')
    else
      render :new
    end
  end

  def update
    @test.author = @user

    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('admin.tests.update.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('admin.tests.delete.success')
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = current_user
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end
