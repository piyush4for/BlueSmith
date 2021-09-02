//Tell web3 that a deployed copy of the campaignFactory exists
import web3 from './web3';
import CampaignFactory from './build/Factory.json'
import { exportDefaultDeclaration } from 'babel-types';

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface),
    '0x75dE93e43e36e77256401215903EFE01EcBAE41B'
);

export default instance;