get '/database-calls/table' do 
  if request.xhr?
    return if params[:value] == ""
    tables_hash = return_tables_hash()
    column_names = tables_hash[params[:value].to_sym].column_names[0..-3]
    {"column_names": column_names}.to_json
  end
end

get '/database-calls/find-data' do 
  if request.xhr?
    tables_hash = return_tables_hash()
    obj = tables_hash[params[:table].to_sym].find_by(id: params[:id])
    {"result": obj}.to_json
  end
end

put '/database-calls/update-data' do
  authorize!
  if request.xhr?
    tables_hash = return_tables_hash()
    entry = tables_hash[params[:table].to_sym].find_by(id: params[:id])
    params_no_table = params
    params_no_table.delete("table")
    entry.update(params_no_table)
    {"result": entry}.to_json
  end
end