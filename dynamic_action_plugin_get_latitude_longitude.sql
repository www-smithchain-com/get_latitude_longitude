prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>1810418193191039
,p_default_application_id=>108
,p_default_owner=>'ADMIN'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/get_latitude_longitude
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(21898200716613436)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'GET.LATITUDE.LONGITUDE'
,p_display_name=>'GET_LATITUDE_LONGITUDE'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION GET_LATITUDE_LONGITUDE (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME        => ''getLatitude_Longitude'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL,',
'        P_CHECK_TO_ADD_MINIFIED=>TRUE',
'    );  ',
'   -- apex_javascript.add_library (p_name => ''latitude_longitude.min'', p_directory => p_plugin.file_prefix, p_version => null, p_check_to_add_minified => TRUE);',
'',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'    function () {getLatitude_Longitude(this); }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'GET_LATITUDE_LONGITUDE'
,p_standard_attributes=>'ITEM'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.2.0'
,p_files_version=>2
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E206765744C617469747564655F4C6F6E6769747564652865297B636F6E737420743D5B2428652E6166666563746564456C656D656E7473295D3B2428652E6166666563746564456C656D656E7473292E6C656E6774683B323D3D2428';
wwv_flow_api.g_varchar2_table(2) := '652E6166666563746564456C656D656E7473292E6C656E6774683F242E6561636828742C66756E6374696F6E28742C6F297B766172206E3D6F5B305D2E69642C6C3D6F5B315D2E69643B636F6E736F6C652E6C6F67286E292C242866756E6374696F6E28';
wwv_flow_api.g_varchar2_table(3) := '297B6E6176696761746F722E67656F6C6F636174696F6E3F6E6176696761746F722E67656F6C6F636174696F6E2E67657443757272656E74506F736974696F6E2866756E6374696F6E2874297B76617220613D2220222B742E636F6F7264732E6C617469';
wwv_flow_api.g_varchar2_table(4) := '747564652B2220222C693D2220222B742E636F6F7264732E6C6F6E6769747564652B2220223B636F6E736F6C652E6C6F67286F292C636F6E736F6C652E6C6F672865292C2428226C6162656C5B666F723D222B6E2B225D22292E7465787428224C617469';
wwv_flow_api.g_varchar2_table(5) := '7475646522292C24282223222B6E292E76616C2861292C2428226C6162656C5B666F723D222B6C2B225D22292E7465787428224C6F6E67697475646522292C24282223222B6C292E76616C2869297D293A616C6572742822536F7272792C20796F757220';
wwv_flow_api.g_varchar2_table(6) := '62726F7773657220646F6573206E6F7420737570706F72742048544D4C352067656F6C6F636174696F6E2E22297D297D293A616C6572742822416666656374656420456C656D656E7473204D75737420686176652074776F204974656D22297D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(21898596244617482)
,p_plugin_id=>wwv_flow_api.id(21898200716613436)
,p_file_name=>'getLatitude_Longitude.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
