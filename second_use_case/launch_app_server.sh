#!/bin/sh

STACK_NAME='A1'
KEY_NAME='heat_key'
REGION_NAME='RegionOne'
EXTERNAL_NETWORK_ID=`neutron net-list | grep public | awk '{print $2}' | xargs -I% echo %`
EXTERNAL_GATEWAY_IP_ADDRESS='172.24.4.233'
SUBNET_CIDR='10.1.0.0/24'
SUBNET_POOL_START='10.1.0.10'
SUBNET_POOL_END='10.1.0.200'
VPN_PEER_CIDR='10.2.0.0/24'
DB_SERVER_IP_ADDRESS='10.2.0.10'

heat stack-create ${STACK_NAME} -f app_server.template -P "KeyName=${KEY_NAME};RegionName=${REGION_NAME};ExternalNetworkId=${EXTERNAL_NETWORK_ID};ExternalGatewayIPAddress=${EXTERNAL_GATEWAY_IP_ADDRESS};SubnetCidr=${SUBNET_CIDR};SubnetPoolStart=${SUBNET_POOL_START};SubnetPoolEnd=${SUBNET_POOL_END};VPNPeerCidr=${VPN_PEER_CIDR};DBServerIPAddress=${DB_SERVER_IP_ADDRESS}"