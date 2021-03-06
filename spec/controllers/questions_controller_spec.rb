require 'rails_helper'
include RandomData
RSpec.describe QuestionsController, type: :controller do

  let(:my_question) { Question.create!( title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false) }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assign [my_question] to @question" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_question.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view"do
      get :show, params: {id: my_question.id }
      expect(response).to render_template :show
    end

    it "assigns my_question to @question" do
      get :show, params: { id: my_question.id }
      expect(assigns(:question)).to eq(my_question)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "Post create" do
    it "increase the number of Post by 1" do
      expect{ post :create, params: { question: { title: "Title", body: "Body", resolved: false } } }.to change(Question,:count).by(1)
    end

    it "assigns the new question to @Question" do
      post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false } }
      expect(assigns(:question)).to eq Question.last
    end

    it "redirects to the new post" do
        post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false } }

        expect(response).to redirect_to Question.last
      end
    end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: {id: my_question.id}
      expect(response).to render_template :edit
    end

    it "assigns post to be updated to @question" do
      get :edit, params: { id: my_question.id}

      question_instance = assigns( :question)

      expect(question_instance.id).to eq my_question.id
      expect(question_instance.title).to eq my_question.title
      expect(question_instance.body).to eq my_question.body
      expect(question_instance.resolved).to eq my_question.resolved

    end
  end

  describe "Put update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: { id: my_question.id, question: {title: new_title, body: new_body, resolved: false} }

      updated_question = assigns(:question)
      expect(updated_question.id).to eq my_question.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
    end

    it "redirects to updated question" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: {id: my_question.id, question: {title: new_title, body: new_body, resolved: true} }
      expect(response).to redirect_to my_question
    end
  end

  describe  "Delete destroy" do
    it "deletes the post" do
      delete :destroy, params: { id: my_question.id }

      count = Question.where({id: my_question.id}).size
      expect(count).to eq 0
    end

    it "redirects to question index" do
      delete :destroy, params: { id: my_question.id }
      expect(response).to redirect_to questions_path
    end
  end
end
