RSpec.describe Api::V1::CitiesController, type: :controller do
  subject { create :city, :with_country }
 
  describe 'GET #index' do
    it 'return status 200' do
      get :index
      expect(response).to be_success
    end
  end
  
  describe 'GET #show' do
    context 'when city found' do
      before do
        get :show, params: { id: subject.id }
      end
      it 'assigns city' do
        expect(assigns(:city)).to eq(subject)
      end
      it 'renders the :show template' do
        expect(response).to be_success
      end
    end
  end
  
end