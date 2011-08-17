module FeatureGetterHelper

  def get_feature
    results = CartoDB::Connection.query("SELECT * FROM #{Cartoset::Config['features_table']} WHERE cartodb_id = #{params[:id]}") if params[:id]
    @feature = results.rows.first if results && results.rows.present?
  end
  private :get_feature

end