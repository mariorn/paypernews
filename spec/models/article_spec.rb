require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'an article with all the parameters empty' do
    before (:each) do
      article = Article.create({ title: '', lead: '', body: '' })
    end

    it 'should not save the register' do
      articles = Article.all
      expect(articles.length).to be(0)
    end
  end

  context 'an article with the title, lead and body empty' do
    before (:each) do
      article = Article.create({ title: '', lead: '', body: '' })
    end

    it 'should not save the register' do
      articles = Article.all
      expect(articles.length).to be(0)
    end
  end

  context 'an article with the body empty' do
    before (:each) do
      article = Article.create({ title: 'Title', lead: 'Lead', body: '' })
    end

    it 'should not save the register' do
      articles = Article.all
      expect(articles.length).to be(0)
    end
  end

  context 'an article with the fields correctly filled' do
    before (:each) do
      article = Article.create({ title: 'Title', lead: 'Lead', body: 'Body' })
    end

    it 'should save the register' do
      articles = Article.all
      expect(articles.length).to be(1)
    end
  end
end
