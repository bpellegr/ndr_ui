require 'test_helper'

# Test bootstrap form builder inline errors
class InlineErrorsAndWarningsTest < ActionView::TestCase
  tests ActionView::Helpers::FormHelper
  include NdrUi::BootstrapHelper

  test 'should create alias feature methods' do
    post = Post.new

    bootstrap_form_for post do |form|
      assert form.respond_to?(:text_field_with_inline_errors)
      assert form.respond_to?(:text_field_without_inline_errors)

      assert form.respond_to?(:collection_select_with_inline_errors)
      assert form.respond_to?(:collection_select_without_inline_errors)

      assert form.respond_to?(:time_select_with_inline_errors)
      assert form.respond_to?(:time_select_without_inline_errors)

      refute form.respond_to?(:hidden_field_with_inline_errors)
      refute form.respond_to?(:hidden_field_without_inline_errors)
    end
  end

  test 'each field should have a single help-block' do
    post = Post.new

    bootstrap_form_for post do |form|
      assert_dom_equal(
        '<input class="form-control" type="text" name="post[created_at]" id="post_created_at" />' \
        '<span class="help-block" data-feedback-for="post_created_at">' \
        '<span class="text-danger"></span><span class="text-warning"></span>' \
        '</span>',
        form.text_field(:created_at)
      )
    end
  end

  test 'should display warnings' do
    post = Post.new
    post.warnings[:created_at] << 'some' << 'message'

    bootstrap_form_for post do |form|
      assert_dom_equal(
        '<input class="form-control" type="text" name="post[created_at]" id="post_created_at" />' \
        '<span class="help-block" data-feedback-for="post_created_at">' \
        '<span class="text-danger"></span><span class="text-warning">some<br>message</span>' \
        '</span>',
        form.text_field(:created_at)
      )
    end
  end

  test 'should display errors' do
    post = Post.new
    post.errors.add(:created_at, 'not')
    post.errors.add(:created_at, 'great')

    bootstrap_form_for post do |form|
      assert_dom_equal(
        '<input class="form-control" type="text" name="post[created_at]" id="post_created_at" />' \
        '<span class="help-block" data-feedback-for="post_created_at">' \
        '<span class="text-danger">not<br>great</span><span class="text-warning"></span>' \
        '</span>',
        form.text_field(:created_at)
      )
    end
  end
end
