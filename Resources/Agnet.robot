*** Settings ***
Library    AppiumLibrary
Library    String
Resource    Common.robot
*** Variables ***
#*** Home Variables ***
${AGNET-ICON}       id=com.airbus.agnet.mission:id/bootstrapAppLogo
${ORGANIZATION-ID-FIELD}    id=com.airbus.agnet.mission:id/bootstrapOrganizationId
${TERMS-CHECKBOX}   id=com.airbus.agnet.mission:id/bootstrapAcceptTermsCheckbox
${REGISTER-BUTTON}  id=com.airbus.agnet.mission:id/bootstrapRegisterOrganizationButton

#*** Settings Context ***
${APPLY-BUTTON}     id=com.airbus.agnet.mission:id/changeDefaultUrlsApply
${CONF-FIELD}       id=com.airbus.agnet.mission:id/changeDefaultUrlsConfigServer
${HOSTNAME-FIELD}   id=com.airbus.agnet.mission:id/changeDefaultUrlsHostName
