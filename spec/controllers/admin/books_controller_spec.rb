require 'rails_helper'
include Auth0


RSpec.describe Admin::BooksController, type: :controller do

  describe "GET #new" do

      before(:each) do
        @user = create(:user)
      end

    it "assigns a new book to @book" do
      get :new, session: mock_auth_hash
      expect(assigns(:book)).to be_a_new(Book) 
    end

    it "renders the :new template" do 
      get :new, session: mock_auth_hash
      expect(response).to render_template :new 
    end
  end

  describe "POST #create" do
      before(:each) do
        @current_user = create(:user)
        @book = create(:book, 
                      user_id: @current_user.id)
      end

      context "with valid attributes" do
        it "saves the new book in the database" do
          params = {
            book: {
              title: "sup book",
              user_id: @current_user.id,
              description: "blah blah blah",
              question_attributes: {
                  content: 'content stuff',
                  data: {
                    question_one: "this is question one",
                    question_two: "this is question two",
                    question_three: "this is question three"
                  }
                },
              max_downloads: 20
            }
          }
          expect{ post :create, params: params, session: mock_auth_hash 
            }.to change(Book, :count).by (1)
          end
      end

      it "redirects to admin" do
        params = {
            book: {
              title: "sup book",
              user_id: @current_user.id,
              description: "blah blah blah",
              question_attributes: {
                  content: 'content stuff',
                  data: {
                    question_one: "this is question one",
                    question_two: "this is question two",
                    question_three: "this is question three"
                  }
                },
              max_downloads: 20
            }
          }
        post :create, params: params, session: mock_auth_hash 
          book = Book.last
          expect(flash[:success]).to eq("Book created!")
        expect(response).to redirect_to "/books/#{book.id}"
      end

      it "expect 3 questions" do
        params = {
            book: {
              title: "sup book",
              user_id: @current_user.id,
              description: "blah blah blah",
              question_attributes: {
                  content: 'content stuff',
                  data: {
                    question_one: "this is question one",
                    question_two: "this is question two",
                    question_three: "this is question three"
                  }
                },
              max_downloads: 20
            }
          }
        post :create, params: params, session: mock_auth_hash
        questions = Question.all
        question = questions.last
         expect(questions.length).to eq(1)
         expect(question.data["question_one"]).to eq("this is question one")
         expect(question.data["question_two"]).to eq("this is question two")
         expect(question.data["question_three"]).to eq("this is question three")
      end

      it "expect book to belong to current_user" do
        params = {
            book: {
              title: "sup book",
              description: "blah blah blah",
              question_attributes: {
                  content: 'content stuff',
                  data: {
                    question_one: "this is question one",
                    question_two: "this is question two",
                    question_three: "this is question three"
                  }
                },
              max_downloads: 20
            }
          }
          post :create, params: params, session: mock_auth_hash
          book = Book.last
          expect(book.user).to eq(@current_user)
      end
  end

  describe "GET #edit" do
    before(:each) do
      @current_user = create(:user)
      @book = create(:book, 
                      user_id: @current_user.id)
      @params = { id: @book.id }

    end

      it "assigns the requested book to @book" do
        get :edit, params: @params, session: mock_auth_hash
        expect(assigns(:book)).to eq @book
      end

      it "renders the :edit template" do 
        get :edit, params: @params, session: mock_auth_hash
        expect(response).to render_template :edit 
      end
  end

  describe "PATCH #update" do

    before(:each) do
      @user = create(:user)
      @book = create(:book, 
                      user_id: @user.id)
    end
    
    it "updates a book" do
      params = {
            id: @book.id,
            book: {
              title: "changed book title",
              description: "changed book description",
              question_attributes: {
                  content: 'content stuff',
                  data: {
                    question_one: "updated question one",
                    question_two: "updated question two",
                    question_three: "updated question three"
                  }
                },
              max_downloads: 20
            }
          }

      patch :update, params: params, book: params, session: mock_auth_hash
      questions = Question.all
      question = questions.last
      changed_book = Book.last
      expect(changed_book.title).to eq("changed book title")
      expect(changed_book.description).to eq("changed book description")
      expect(response).to redirect_to(admin_path)
      expect(flash[:success]).to eq("Book has been successfully updated.")
      expect(question.data["question_one"]).to eq("updated question one")
         expect(question.data["question_two"]).to eq("updated question two")
         expect(question.data["question_three"]).to eq("updated question three")
    end
  end

  describe "GET #destroy" do
    before(:each) do
      @user = create(:user)
      @book = create(:book, 
                      user_id: @user.id)
    end


    it "returns http success" do
      params = {id: @book.id}
      delete :destroy, params: params, session: mock_auth_hash
      books = Book.all
      expect(books.length).to eq(0)
      expect(response).to redirect_to(admin_path)
      expect(flash[:success]).to eq("Book has been successfully deleted.")
    end
  end

  # describe "GET #index" do

  # end

  # describe "GET #show" do
  #   before(:each) do
  #     @user = create(:user)
  #     @book = create(:book, 
  #                     user_id: @user.id)
  #   end

  #   it "assigns the requested book to @book" do
  #     get :show, id: @book.id
  #     expect(assigns(:book)).to eq(@book)
  #   end

  #   it "renders the :show template" do
  #     get :show, id: @book.id
  #     expect(response).to render_template :show
  #   end
  # end

end
