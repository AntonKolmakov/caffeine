require 'spec_helper'

describe Admin::ImportsController, type: :controller do
  describe '#create' do
    before do

      # sign_in test helper by Devise
      sign_in create :admin
      allow(ImportProductionSiteData::Import).to receive(:call).and_return(context)
    end

    context 'when successful import data' do
      let(:context) { double(:context, success?: true) }

      it 'sets successful flash message' do
        post :create

        expect(flash[:notice]).to be_present
      end
    end

    context 'when failed import data' do
      let(:context) { double(:context, success?: false) }

      it 'sets failed flash message' do
        post :create

        expect(flash[:warning]).to be_present
      end
    end
  end

  describe '#destroy' do
    it '' do
      sign_in create :admin
      allow(RollbackImportedData::Rollback).to receive(:call)

      delete :destroy

      expect(flash[:notice]).to be_present
    end
  end
end

