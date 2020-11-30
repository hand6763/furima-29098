require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password,password_confirmation,sei,mei,sei_kana,mei_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank" )
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank" )
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "seiが空では登録できない" do
        @user.sei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei can't be blank")
      end
      it "seiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.sei = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei is invalid")
      end
      it "meiが空では登録できない" do
        @user.mei = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei can't be blank")
      end
      it "meiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.mei = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei is invalid")
      end
      it "sei_kanaが空では登録できない" do
        @user.sei_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kana can't be blank")
      end
      it "sei_kanaが全角（カタカナ）でないと登録できない" do
        @user.sei_kana = "ああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kana is invalid")
      end
      it "mei_kanaが空では登録できない" do
        @user.mei_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kana can't be blank")
      end
      it "mei_kanaが全角（カタカナ）でないと登録できない" do
        @user.mei_kana = "ああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
