native SendMail(from[],to[], subject[], body[]);
native MailLog();

stock Mail(from[],to[],subject[],body[])
{
	new string[256];
	new File:file = fopen("EmailSend.txt", io_write);
	fwrite(file,"date: todays-date\n");
	format(string,sizeof(string),"to: %s\n",to);
	fwrite(file,string);
	format(string,sizeof(string),"subject: %s\n",subject);
	fwrite(file,string);
	format(string,sizeof(string),"from: %s\n\n",from);
	fwrite(file,string);
	fwrite(file,body);
	fclose(file);
	SendMail(from,to,subject,body);
	return 1;
}