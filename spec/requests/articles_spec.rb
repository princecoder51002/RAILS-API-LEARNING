require 'rails_helper'

RSpec.describe ArticlesController do 

    describe '#index' do 
      it 'returns a success response' do 
           get '/articles'
           expect(response).to have_http_status(:ok) # it resembles expect(response.status).to eq(200)
      end

      it "return a proper json" do 
          article = FactoryBot.create(:article)
          get '/articles'
          body = json
          expect(json_data).to eq(
              [
                {
                    id: article.id.to_s,
                    type: 'article',
                    attributes: {
                        title: article.title,
                        content: article.content,
                        slug: article.slug
                    }
                }
              ]
          )
      end

#       it "paginates results" do 
#            article1, article2, article3 = create_list(:article, 3)
#            get '/articles', params: { page: { number: 2, size: 1}}
#            expect(json_data.length).to eq(1)
#            expect(json_data.first[:id]).to eq(article2.id)
#       end

#       it "contains pagination links in the response" do 
#         article1, article2, article3 = create_list(:article, 3)
#         get '/articles', params: { page: { number: 2, size: 1}}
#         expect(json['links'].length).to eq(5)
#         expect(json['links'].keys).to contain_exactly(
#             'first', 'prev', 'next', 'last', 'self'
#         )
#    end

    end
end