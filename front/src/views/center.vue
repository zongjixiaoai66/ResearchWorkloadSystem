<template>
  <div>
    <el-form
      class="detail-form-content"
      ref="ruleForm"
      :model="ruleForm"
      label-width="80px"
    >  
     <el-row>
                    <el-col :span="12">
           <el-form-item v-if="flag=='mishu'"  label='秘书工号' prop="mishuUuidNumber">
               <el-input v-model="ruleForm.mishuUuidNumber"  placeholder='秘书工号' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
           <el-form-item v-if="flag=='mishu'"  label='秘书姓名' prop="mishuName">
               <el-input v-model="ruleForm.mishuName"  placeholder='秘书姓名' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
           <el-form-item v-if="flag=='mishu'"  label='秘书手机号' prop="mishuPhone">
               <el-input v-model="ruleForm.mishuPhone"  placeholder='秘书手机号' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
             <el-form-item v-if="flag=='mishu'" label='秘书头像' prop="mishuPhoto">
                 <file-upload
                         tip="点击上传照片"
                         action="file/upload"
                         :limit="3"
                         :multiple="true"
                         :fileUrls="ruleForm.mishuPhoto?ruleForm.mishuPhoto:''"
                         @change="mishuPhotoUploadChange"
                 ></file-upload>
             </el-form-item>
         </el-col>
         <el-col :span="12">
           <el-form-item v-if="flag=='mishu'"  label='电子邮箱' prop="mishuEmail">
               <el-input v-model="ruleForm.mishuEmail"  placeholder='电子邮箱' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
           <el-form-item v-if="flag=='jiaoshi'"  label='教师工号' prop="jiaoshiUuidNumber">
               <el-input v-model="ruleForm.jiaoshiUuidNumber"  placeholder='教师工号' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
           <el-form-item v-if="flag=='jiaoshi'"  label='教师姓名' prop="jiaoshiName">
               <el-input v-model="ruleForm.jiaoshiName"  placeholder='教师姓名' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
           <el-form-item v-if="flag=='jiaoshi'"  label='教师手机号' prop="jiaoshiPhone">
               <el-input v-model="ruleForm.jiaoshiPhone"  placeholder='教师手机号' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
           <el-form-item v-if="flag=='jiaoshi'"  label='教师身份证号' prop="jiaoshiIdNumber">
               <el-input v-model="ruleForm.jiaoshiIdNumber"  placeholder='教师身份证号' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-col :span="12">
             <el-form-item v-if="flag=='jiaoshi'" label='教师头像' prop="jiaoshiPhoto">
                 <file-upload
                         tip="点击上传照片"
                         action="file/upload"
                         :limit="3"
                         :multiple="true"
                         :fileUrls="ruleForm.jiaoshiPhoto?ruleForm.jiaoshiPhoto:''"
                         @change="jiaoshiPhotoUploadChange"
                 ></file-upload>
             </el-form-item>
         </el-col>
         <el-col :span="12">
           <el-form-item v-if="flag=='jiaoshi'"  label='电子邮箱' prop="jiaoshiEmail">
               <el-input v-model="ruleForm.jiaoshiEmail"  placeholder='电子邮箱' clearable></el-input>
           </el-form-item>
         </el-col>

         <el-form-item v-if="flag=='users'" label="用户名" prop="username">
             <el-input v-model="ruleForm.username"
                       placeholder="用户名"></el-input>
         </el-form-item>
         <el-col :span="12">
             <el-form-item v-if="flag!='users'"  label="性别" prop="sexTypes">
                 <el-select v-model="ruleForm.sexTypes" placeholder="请选择性别">
                     <el-option
                             v-for="(item,index) in sexTypesOptions"
                             v-bind:key="item.codeIndex"
                             :label="item.indexName"
                             :value="item.codeIndex">
                     </el-option>
                 </el-select>
             </el-form-item>
         </el-col>
         <el-col :span="24">
             <el-form-item>
                 <el-button type="primary" @click="onUpdateHandler">修 改</el-button>
             </el-form-item>
         </el-col>
     </el-row>
    </el-form>
  </div>
</template>
<script>
// 数字，邮件，手机，url，身份证校验
import { isNumber,isIntNumer,isEmail,isMobile,isPhone,isURL,checkIdCard } from "@/utils/validate";

export default {
  data() {
    return {
      ruleForm: {},
      flag: '',
      usersFlag: false,
      sexTypesOptions : [],
    };
  },
  mounted() {
    //获取当前登录用户的信息
    var table = this.$storage.get("sessionTable");
    this.sessionTable = this.$storage.get("sessionTable");
    this.role = this.$storage.get("role");
    if (this.role != "管理员"){
    }

    this.flag = table;
    this.$http({
      url: `${this.$storage.get("sessionTable")}/session`,
      method: "get"
    }).then(({ data }) => {
      if (data && data.code === 0) {
        this.ruleForm = data.data;
      } else {
        this.$message.error(data.msg);
      }
    });
      this.$http({
          url: `dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types`,
          method: "get"
      }).then(({ data }) => {
          if (data && data.code === 0) {
          this.sexTypesOptions = data.data.list;
      } else {
          this.$message.error(data.msg);
      }
  });
  },
  methods: {
    mishuPhotoUploadChange(fileUrls) {
        this.ruleForm.mishuPhoto = fileUrls;
    },
    jiaoshiPhotoUploadChange(fileUrls) {
        this.ruleForm.jiaoshiPhoto = fileUrls;
    },

    onUpdateHandler() {
                         if((!this.ruleForm.mishuUuidNumber)&& 'mishu'==this.flag){
                             this.$message.error('秘书工号不能为空');
                             return
                         }

                         if((!this.ruleForm.mishuName)&& 'mishu'==this.flag){
                             this.$message.error('秘书姓名不能为空');
                             return
                         }

                             if( 'mishu' ==this.flag && this.ruleForm.mishuPhone&&(!isMobile(this.ruleForm.mishuPhone))){
                                 this.$message.error(`手机应输入手机格式`);
                                 return
                             }
                         if((!this.ruleForm.mishuPhoto)&& 'mishu'==this.flag){
                             this.$message.error('秘书头像不能为空');
                             return
                         }

                             if( 'mishu' ==this.flag && this.ruleForm.mishuEmail&&(!isEmail(this.ruleForm.mishuEmail))){
                                 this.$message.error(`邮箱应输入邮箱格式`);
                                 return
                             }
                         if((!this.ruleForm.jiaoshiUuidNumber)&& 'jiaoshi'==this.flag){
                             this.$message.error('教师工号不能为空');
                             return
                         }

                         if((!this.ruleForm.jiaoshiName)&& 'jiaoshi'==this.flag){
                             this.$message.error('教师姓名不能为空');
                             return
                         }

                             if( 'jiaoshi' ==this.flag && this.ruleForm.jiaoshiPhone&&(!isMobile(this.ruleForm.jiaoshiPhone))){
                                 this.$message.error(`手机应输入手机格式`);
                                 return
                             }
                         if((!this.ruleForm.jiaoshiIdNumber)&& 'jiaoshi'==this.flag){
                             this.$message.error('教师身份证号不能为空');
                             return
                         }

                         if((!this.ruleForm.jiaoshiPhoto)&& 'jiaoshi'==this.flag){
                             this.$message.error('教师头像不能为空');
                             return
                         }

                             if( 'jiaoshi' ==this.flag && this.ruleForm.jiaoshiEmail&&(!isEmail(this.ruleForm.jiaoshiEmail))){
                                 this.$message.error(`邮箱应输入邮箱格式`);
                                 return
                             }
        if((!this.ruleForm.sexTypes) && this.flag!='users'){
            this.$message.error('性别不能为空');
            return
        }
      if('users'==this.flag && this.ruleForm.username.trim().length<1) {
        this.$message.error(`用户名不能为空`);
        return	
      }
      this.$http({
        url: `${this.$storage.get("sessionTable")}/update`,
        method: "post",
        data: this.ruleForm
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.$message({
            message: "修改信息成功",
            type: "success",
            duration: 1500,
            onClose: () => {
            }
          });
        } else {
          this.$message.error(data.msg);
        }
      });
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
