require 'test_helper'

module V1
  class IntegrationTest < ActionDispatch::IntegrationTest
    private

    def path
      assert false, 'Warning: Your test is missing the `def path`'
    end

    def headers
      assert false, 'Warning: Your test is missing the `def header`'
    end

    def test_fixture
      assert false, 'Warning: Your test is missing the `def test_fixture`'
    end

    def expected_attributes
      assert false, 'Warning: Your test is missing the `def expected_attributes`'
    end

    def expected_relationships
      assert false, 'Warning: Your test is missing the `def expected_attributes`'
    end

    def assert_can_fetch_all(allowed, expected_length)
      get path, headers: headers

      if allowed
        assert_response 200
        data = JSON.parse(@response.body)['data']
        assert_equal Array, data.class
        assert_equal expected_length, data.length
      else
        assert_response 403
      end
    end

    def assert_can_fetch_one_by_id(allowed)
      get "#{path}/#{test_fixture.id}", headers: headers

      if allowed
        assert_response 200
        assert_json_response
      else
        assert_response 403
      end
    end

    def assert_cannot_fetch_bogus_id
      get "#{path}/bogus-id", headers: public_header
      assert_response 422
    end

    def assert_can_fetch_one_by_slug(allowed)
      return assert true unless test_fixture.has_attribute?('slug')

      get "#{path}/?slug=#{test_fixture.slug}", headers: headers

      if allowed
        assert_response 200
        assert_json_response
      else
        assert_response 403
      end
    end

    def assert_cannot_fetch_bogus_slug
      get "#{path}/?slug=bogus-slug", headers: headers
      assert_response 422
    end

    def assert_json_response
      data = JSON.parse(@response.body)['data']

      assert_equal Hash, data.class
      assert_equal data['id'], test_fixture.id

      expected_attributes.each do |attr|
        assert_equal test_fixture[attr].to_s, data['attributes'][attr.to_s.dasherize]
      end

      expected_relationships.each do |rel|
        refute_nil data['relationships'][rel.to_s.dasherize]['data']['id']
      end

      assert_equal expected_attributes.length, data['attributes'].length
      assert_equal expected_relationships.length, data['relationships'].length
    end

    def assert_can_create(allowed)
      params = {}

      post path, params: params, headers: headers

      if allowed
        assert_response 201
        # TODO
      else
        assert_response 403
      end
    end

    def assert_can_update(allowed)
      params = {}

      put "#{path}/#{test_fixture.id}", params: params, headers: headers

      if allowed
        assert_response 200
        # TODO
      else
        assert_response 403
      end
    end

    def assert_can_delete(allowed)
      delete "#{path}/#{test_fixture.id}", headers: headers

      if allowed
        assert_response 200
      else
        assert_response 403
      end
    end
  end
end
