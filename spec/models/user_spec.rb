require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できる時' do
    it '登録できる時' do
      expect(@user).to be_valid
    end
  end

  context '新規登録ができない時' do
    it 'family_nameが空では登録できない時' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'family_nameは数字では登録できないこと' do
      @user.family_name = "1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name は、全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it 'family_nameはアルファベットでは登録できないこと' do
      @user.family_name = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name は、全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it 'last_nameが空では登録できること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameは数字では登録できないこと' do
      @user.last_name = "1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は、全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it 'last_nameはアルファベットでは登録できないこと' do
      @user.last_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は、全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it 'phone_numberが空では登録できないこと' do
      @user.phone_number = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberはアルファベットでは登録できないこと' do
      @user.phone_number = "aaaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number は、(-)ハイフン無し、または11桁以内の数字で入力してください")
    end

    it 'phone_numberはハイフンを含むと登録できないこと' do
      @user.phone_number = "090-1234-5678"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number は、(-)ハイフン無し、または11桁以内の数字で入力してください")
    end

    it 'phone_numberは11桁以内でないと登録できないこと' do
      @user.phone_number = "090012345678"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number は、(-)ハイフン無し、または11桁以内の数字で入力してください")
    end

    it 'company_nameが空では登録できないこと' do
      @user.company_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Company name can't be blank")
    end

    it 'company_nameは数字では登録できないこと' do
      @user.company_name = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Company name は、全角（漢字・ひらがな・カタカナ）、または英字(大文字)で入力してください")
    end

    it 'company_nameは半角英字(小文字)では登録できないこと' do
      @user.company_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Company name は、全角（漢字・ひらがな・カタカナ）、または英字(大文字)で入力してください")
    end

    it 'positionを選択しないと登録できないこと' do
      @user.position_id = 0
      @user.valid?
      expect(@user.errors.full_messages).to include("Position can't be blank")
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに＠を含む必要があること' do
      @user.email = '1111com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必要であること' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードと確認用パスワードの値が一致すること' do
      @user.password = '123aaaa'
      @user.password_confirmation = '123iiii'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
