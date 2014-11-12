require 'spec_helper'

describe Admin::ImportsController, type: :controller do
  before do

    # Warn when expectation is set on nil
    allow_message_expectations_on_nil

    # warden executed before the chief Rails application is invoked
    allow(request.env['warden']).to receive(:authenticate!)
    allow(Admin::ApplicationController).to receive(:authenticate_admin_user!)
  end

  describe '#create' do
    before do
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
    it 'successfuly rollback imported current data' do
      allow(RollbackImportedData::Rollback).to receive(:call)

      delete :destroy

      expect(flash[:notice]).to be_present
    end
  end
end
