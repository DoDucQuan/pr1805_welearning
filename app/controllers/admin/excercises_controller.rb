class Admin::ExcercisesController < Admin::BaseController

  before_action :load_excercise, only: [:show, :edit, :destroy]
  # before_action :load_course, only: [:new, :create, :destroy]

  def show; end

  def new
    @excercise = @lesson.excercises.build
  end

  def create
    @excercise = @lesson.excercises.build excerise_params
    if @excercise.save
      flash[:success] = "Tạo bài tập thành công!"
      redirect_to new_admin_sname_lesson_excercise_path @lesson
    else
      flash[:danger] = "Bạn chưa điền đầy đủ thông tin bài tập"
      render :new
    end
  end

  def edit; end

  def update
    if @excercise.update_attributes excercise_params
      flash[:success] = "Cập nhật bài tập thành công!"
      redirect_to admin_lesson_path @lesson
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    flash[:danger] = "Xóa bài tập thành công!"
    redirect_to admin_lesson_path @excercise.lesson
  end

  private
  def excercise_params
    params.require(:excercise).permit :excercise_tittle, :questions,
      :answers
  end

  def load_excercise
    @excercise = Excercise.find_by id: params[:excercise_id]
  end

  # def load_lesson
  #   @lesson = Lesson.find_by id: params[:id]
  # end
end